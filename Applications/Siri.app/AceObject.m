@interface AceObject
- (BOOL)_afui_updateMapsAnalytics;
- (id)_afui_mapsRelatedChild;
- (id)_afui_mapsRelatedChildren;
@end

@implementation AceObject

- (id)_afui_mapsRelatedChild
{
  return 0LL;
}

- (id)_afui_mapsRelatedChildren
{
  return 0LL;
}

- (BOOL)_afui_updateMapsAnalytics
{
  if ((objc_opt_respondsToSelector(self, "extSessionGuid") & 1) != 0
    && (objc_opt_respondsToSelector(self, "extSessionGuidCreatedTimestamp") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AceObject extSessionGuid](self, "extSessionGuid"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[AceObject extSessionGuidCreatedTimestamp](self, "extSessionGuidCreatedTimestamp"));
    v5 = (void *)v4;
    if (v3 && v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOUserSession sharedInstance](&OBJC_CLASS___GEOUserSession, "sharedInstance"));
      id v7 = objc_alloc_init(&OBJC_CLASS___GEOUserSessionEntity);
      [v7 updateSessionIDFromUUIDString:v3];
      [v5 timeIntervalSinceReferenceDate];
      objc_msgSend(v7, "setSessionCreationTime:");
      v8 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        objc_opt_class(self, v10);
        v12 = v11;
        id v13 = v11;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[AceObject aceId](self, "aceId"));
        *(_DWORD *)buf = 136315906;
        v28 = "-[AceObject(MapsSession) _afui_updateMapsAnalytics]";
        __int16 v29 = 2112;
        id v30 = v7;
        __int16 v31 = 2112;
        v32 = v12;
        __int16 v33 = 2112;
        v34 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Setting maps user session to %@ from <%@ %@>",  buf,  0x2Au);
      }

      LOBYTE(v15) = 1;
      [v6 setSharedMapsUserSessionEntity:v7 shareSessionIDWithMaps:1];

LABEL_23:
      return (char)v15;
    }

    v16 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006C7E0((uint64_t)self, v16);
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AceObject _afui_mapsRelatedChild](self, "_afui_mapsRelatedChild"));
  unsigned __int8 v18 = objc_msgSend(v17, "_afui_updateMapsAnalytics");

  if ((v18 & 1) == 0)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AceObject _afui_mapsRelatedChildren](self, "_afui_mapsRelatedChildren", 0LL));
    id v15 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v19 = *(void *)v23;
      while (2)
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend( *(id *)(*((void *)&v22 + 1) + 8 * (void)i),  "_afui_updateMapsAnalytics"))
          {
            LOBYTE(v15) = 1;
            goto LABEL_23;
          }
        }

        id v15 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    goto LABEL_23;
  }

  LOBYTE(v15) = 1;
  return (char)v15;
}

@end