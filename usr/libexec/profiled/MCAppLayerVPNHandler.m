@interface MCAppLayerVPNHandler
- (id)installService:(id)a3;
@end

@implementation MCAppLayerVPNHandler

- (id)installService:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 VPNUUID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 SafariDomains]);
  unsigned __int8 v9 = [v6 setPerAppUUID:v7 andSafariDomains:v8];

  if ((v9 & 1) == 0)
  {
    v23 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Could not add Safari App VPN rules", buf, 2u);
    }

    uint64_t v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 displayName]);
    v38 = v26;
    v27 = @"ERROR_VPN_COULD_NOT_INSTALL_SAFARI_DOMAIN";
    goto LABEL_34;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 SMBDomains]);
  unsigned __int8 v11 = [v6 setSMBDomains:v10];

  if ((v11 & 1) == 0)
  {
    v28 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Could not set per-app VPN SMBDomains", buf, 2u);
    }

    uint64_t v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 displayName]);
    v38 = v26;
    v27 = @"ERROR_VPN_COULD_NOT_INSTALL_SMB_DOMAIN";
    goto LABEL_34;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 mailDomains]);
  unsigned __int8 v13 = [v6 setMailDomains:v12];

  if ((v13 & 1) == 0)
  {
    v29 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Could not set per-app VPN mail domains",  buf,  2u);
    }

    uint64_t v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 displayName]);
    v38 = v26;
    v27 = @"ERROR_VPN_COULD_NOT_INSTALL_MAIL_DOMAIN";
    goto LABEL_34;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v5 calendarDomains]);
  unsigned __int8 v15 = [v6 setCalendarDomains:v14];

  if ((v15 & 1) == 0)
  {
    v30 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Could not set per-app VPN calendar domains",  buf,  2u);
    }

    uint64_t v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 displayName]);
    v38 = v26;
    v27 = @"ERROR_VPN_COULD_NOT_INSTALL_CALENDAR_DOMAIN";
    goto LABEL_34;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 contactsDomains]);
  unsigned __int8 v17 = [v6 setContactsDomains:v16];

  if ((v17 & 1) == 0)
  {
    v31 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Could not set per-app VPN contacts domains",  buf,  2u);
    }

    uint64_t v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 displayName]);
    v38 = v26;
    v27 = @"ERROR_VPN_COULD_NOT_INSTALL_CONTACTS_DOMAIN";
    goto LABEL_34;
  }

  if ((objc_msgSend(v6, "setRestrictDomains:", objc_msgSend(v5, "restrictDomains")) & 1) == 0)
  {
    v32 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Could not set per-app VPN domain restrictions",  buf,  2u);
    }

    uint64_t v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 displayName]);
    v38 = v26;
    v27 = @"ERROR_VPN_COULD_NOT_INSTALL_RESTRICTIONS_DOMAIN";
    goto LABEL_34;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedDomains]);
  unsigned __int8 v19 = [v6 setAssociatedDomains:v18];

  if ((v19 & 1) == 0)
  {
    v33 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Could not set per-app VPN associated domains",  buf,  2u);
    }

    uint64_t v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 displayName]);
    v38 = v26;
    v27 = @"ERROR_VPN_COULD_NOT_INSTALL_ASSOCIATED_DOMAIN";
    goto LABEL_34;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v5 excludedDomains]);
  unsigned __int8 v21 = [v6 setExcludedDomains:v20];

  if ((v21 & 1) == 0)
  {
    v34 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Could not set per-app VPN excluded domains",  buf,  2u);
    }

    uint64_t v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 displayName]);
    v38 = v26;
    v27 = @"ERROR_VPN_COULD_NOT_INSTALL_EXCLUDED_DOMAIN";
LABEL_34:
    uint64_t v35 = MCErrorArray(v27);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v24,  15000LL,  v36,  MCErrorTypeFatal,  v38,  0LL));

    goto LABEL_35;
  }

  v22 = 0LL;
LABEL_35:

  return v22;
}

@end