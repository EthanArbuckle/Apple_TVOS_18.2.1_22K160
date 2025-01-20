@interface CLClientKeyPath
+ (CLClientKeyPath)clientKeyPathWithClientAnchor:(id)a3 anchorType:(char)a4;
+ (CLClientKeyPath)clientKeyPathWithClientAnchor:(id)a3 anchorType:(char)a4 subIdentityId:(id)a5 subIdentityType:(char)a6;
+ (CLClientKeyPath)clientKeyPathWithClientKey:(id)a3;
+ (CLClientKeyPath)clientKeyPathWithLegacyClientKey:(id)a3;
+ (CLClientKeyPath)clientKeyPathWithUserName:(id)a3 clientAnchor:(id)a4 anchorType:(char)a5;
+ (CLClientKeyPath)clientKeyPathWithUserName:(id)a3 clientAnchor:(id)a4 anchorType:(char)a5 subIdentityId:(id)a6 subIdentityType:(char)a7;
+ (id)clientKeyPathFromName:(Name *)a3;
+ (id)clientKeyPathFromName:(id)a1 subIdentityId:(SEL)a2 subIdentityType:(Name *)a3;
+ (id)nullClientKeyPath;
- (BOOL)isAuthLimited;
- (BOOL)isAuthSharingSubIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidCKP;
- (CLClientKeyPath)anchorKeyPath;
- (CLClientKeyPath)clientKeyPathWithReplacementAnchor:(id)a3 anchorType:(char)a4;
- (CLClientKeyPath)clientKeyPathWithReplacementSubIdentityId:(id)a3 subIdentityType:(char)a4;
- (CLClientKeyPath)clientKeyPathWithReplacementTypedAnchor:(id)a3;
- (CLClientKeyPath)clientKeyPathWithReplacementTypedSubIdentityId:(id)a3;
- (CLClientKeyPath)limitingCKP;
- (NSString)bundleId;
- (NSString)bundlePath;
- (NSString)clientAnchor;
- (NSString)clientAnchorWithType;
- (NSString)clientKey;
- (NSString)executablePath;
- (NSString)legacyClientKey;
- (NSString)nestedBundleId;
- (NSString)nestedBundlePath;
- (NSString)nestedExecutablePath;
- (NSString)subIdentityId;
- (NSString)subIdentityIdWithType;
- (NSString)userName;
- (NSString)userlessClientKeyPath;
- (NSString)website;
- (NSString)zoneId;
- (Name)clientName;
- (basic_string<char,)cppClientKey;
- (char)anchorType;
- (char)findComponent:(int)a3;
- (char)subIdentityType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extractComponentFromCharPtr:(char *)a3;
- (unint64_t)hash;
@end

@implementation CLClientKeyPath

- (char)findComponent:(int)a3
{
  if ((_os_feature_enabled_impl("CoreLocation", "cl_pula") & 1) != 0)
  {
    int v6 = 0;
  }

  else
  {
    if (!a3)
    {
      sub_101264FA8(self);
LABEL_19:
      dispatch_once(&qword_101934980, &stru_1018774E8);
      goto LABEL_12;
    }

    int v6 = 1;
  }

  result = self->_buffer;
  BOOL v8 = __OFSUB__(a3, v6);
  int v9 = a3 - v6;
  if ((v9 < 0) ^ v8 | (v9 == 0))
  {
LABEL_8:
    if (!*result) {
      return 0LL;
    }
    return result;
  }

  while (1)
  {
    v10 = strchr(result, 58);
    if (!v10) {
      break;
    }
    result = v10 + 1;
    if (!--v9) {
      goto LABEL_8;
    }
  }

  p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
  if (qword_101934980 != -1) {
    goto LABEL_19;
  }
LABEL_12:
  v11 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_ERROR))
  {
    int v13 = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    v16 = "";
    __int16 v17 = 2114;
    v18 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#Warning CLCKP with an incorrect number of components, CKP:%{public, location:escape_only}@}",  (uint8_t *)&v13,  0x1Cu);
  }

  v12 = (os_log_s *)qword_101934988;
  if (os_signpost_enabled((os_log_t)qword_101934988))
  {
    int v13 = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    v16 = "";
    __int16 v17 = 2114;
    v18 = self;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#Warning CLCKP with an incorrect number of components",  "{msg%{public}.0s:#Warning CLCKP with an incorrect number of components, CKP:%{public, location:escape_only}@}",  (uint8_t *)&v13,  0x1Cu);
  }

  return 0LL;
}

- (id)extractComponentFromCharPtr:(char *)a3
{
  v4 = strchr(a3, 58);
  if (v4)
  {
    size_t v5 = v4 - a3;
    if (v4 != a3) {
      return  -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a3,  v5,  4LL);
    }
  }

  else
  {
    size_t v5 = strlen(a3);
    if (v5) {
      return  -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a3,  v5,  4LL);
    }
  }

  return 0LL;
}

+ (id)nullClientKeyPath
{
  if (qword_10199AD58 != -1) {
    dispatch_once(&qword_10199AD58, &stru_101877488);
  }
  return (id)qword_10199AD50;
}

+ (CLClientKeyPath)clientKeyPathWithUserName:(id)a3 clientAnchor:(id)a4 anchorType:(char)a5 subIdentityId:(id)a6 subIdentityType:(char)a7
{
  int v8 = a7;
  LODWORD(v10) = a5;
  if (!a4)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018774E8);
    }
    v34 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68290819;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = 0LL;
      __int16 v59 = 2050;
      uint64_t v60 = (int)v10;
      __int16 v61 = 2114;
      id v62 = a6;
      __int16 v63 = 2050;
      uint64_t v64 = v8;
      __int16 v65 = 2082;
      v66 = "assert";
      __int16 v67 = 2081;
      v68 = "clientAnchor";
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#CLCKP initialization must include anchor, userName:%{public, location:escape_only} @, clientAnchor:%{public, location:escape_only}@, anchorType:%{public, location:CLClientKeyAnchorType}ll d, subIdentityId:%{public, location:escape_only}@, subIdentityType:%{public, location:CLClientKeySubIden tityType}lld, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x58u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018774E8);
      }
    }

    v35 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      *(_DWORD *)buf = 68290819;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = 0LL;
      __int16 v59 = 2050;
      uint64_t v60 = (int)v10;
      __int16 v61 = 2114;
      id v62 = a6;
      __int16 v63 = 2050;
      uint64_t v64 = v8;
      __int16 v65 = 2082;
      v66 = "assert";
      __int16 v67 = 2081;
      v68 = "clientAnchor";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v35,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#CLCKP initialization must include anchor",  "{msg%{public}.0s:#CLCKP initialization must include anchor, userName:%{public, location:escape_only} @, clientAnchor:%{public, location:escape_only}@, anchorType:%{public, location:CLClientKeyAnchorType}ll d, subIdentityId:%{public, location:escape_only}@, subIdentityType:%{public, location:CLClientKeySubIden tityType}lld, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x58u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018774E8);
      }
    }

    v12 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68290819;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = 0LL;
      __int16 v59 = 2050;
      uint64_t v60 = (int)v10;
      __int16 v61 = 2114;
      id v62 = a6;
      __int16 v63 = 2050;
      uint64_t v64 = v8;
      __int16 v65 = 2082;
      v66 = "assert";
      __int16 v67 = 2081;
      v68 = "clientAnchor";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#CLCKP initialization must include anchor, userName:%{public, location:escape_only} @, clientAnchor:%{public, location:escape_only}@, anchorType:%{public, location:CLClientKeyAnchorType}ll d, subIdentityId:%{public, location:escape_only}@, subIdentityType:%{public, location:CLClientKeySubIden tityType}lld, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x58u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm",  213,  "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]");
    goto LABEL_113;
  }

  v12 = (os_log_s *)a4;
  if ((a5 - 101) > 0xB || ((1 << (a5 - 101)) & 0x891) == 0)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018774E8);
    }
    p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
    v46 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68290819;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = v12;
      __int16 v59 = 2050;
      uint64_t v60 = (int)v10;
      __int16 v61 = 2114;
      id v62 = a6;
      __int16 v63 = 2050;
      uint64_t v64 = v8;
      __int16 v65 = 2082;
      v66 = "assert";
      __int16 v67 = 2081;
      v68 = "validateCKPAnchorType(anchorType)";
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#CLCKP anchorType must be valid, userName:%{public, location:escape_only}@, clien tAnchor:%{public, location:escape_only}@, anchorType:%{public, location:CLClientKeyAnchorType}lld, subId entityId:%{public, location:escape_only}@, subIdentityType:%{public, location:CLClientKeySubIdentityType}l ld, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x58u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018774E8);
      }
    }

    v47 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      *(_DWORD *)buf = 68290819;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = v12;
      __int16 v59 = 2050;
      uint64_t v60 = (int)v10;
      __int16 v61 = 2114;
      id v62 = a6;
      __int16 v63 = 2050;
      uint64_t v64 = v8;
      __int16 v65 = 2082;
      v66 = "assert";
      __int16 v67 = 2081;
      v68 = "validateCKPAnchorType(anchorType)";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#CLCKP anchorType must be valid",  "{msg%{public}.0s:#CLCKP anchorType must be valid, userName:%{public, location:escape_only}@, clien tAnchor:%{public, location:escape_only}@, anchorType:%{public, location:CLClientKeyAnchorType}lld, subId entityId:%{public, location:escape_only}@, subIdentityType:%{public, location:CLClientKeySubIdentityType}l ld, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x58u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018774E8);
      }
    }

    v48 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68290819;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = v12;
      __int16 v59 = 2050;
      uint64_t v60 = (int)v10;
      __int16 v61 = 2114;
      id v62 = a6;
      __int16 v63 = 2050;
      uint64_t v64 = v8;
      __int16 v65 = 2082;
      v66 = "assert";
      __int16 v67 = 2081;
      v68 = "validateCKPAnchorType(anchorType)";
      _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#CLCKP anchorType must be valid, userName:%{public, location:escape_only}@, clien tAnchor:%{public, location:escape_only}@, anchorType:%{public, location:CLClientKeyAnchorType}lld, subId entityId:%{public, location:escape_only}@, subIdentityType:%{public, location:CLClientKeySubIdentityType}l ld, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x58u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm",  214,  "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]");
    goto LABEL_113;
  }

  if (a5 == 108 && a7 != 112)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018774E8);
    }
    v39 = (os_log_s *)qword_101934988;
    p_vtable = (void **)"";
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68290819;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = v12;
      __int16 v59 = 2050;
      uint64_t v60 = 108LL;
      __int16 v61 = 2114;
      id v62 = a6;
      __int16 v63 = 2050;
      uint64_t v64 = v8;
      __int16 v65 = 2082;
      v66 = "assert";
      __int16 v67 = 2081;
      v68 = "subIdentityType == kSubIdentityTypeNestedBundlePath";
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#CLCKP LimitingBundleId anchors must have a subIdentity of type kSubIdentityTypeNestedBun dlePath, userName:%{public, location:escape_only}@, clientAnchor:%{public, location:escape_only}@, a nchorType:%{public, location:CLClientKeyAnchorType}lld, subIdentityId:%{public, location:escape_only}@,  subIdentityType:%{public, location:CLClientKeySubIdentityType}lld, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x58u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018774E8);
      }
    }

    v40 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      *(_DWORD *)buf = 68290819;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = v12;
      __int16 v59 = 2050;
      uint64_t v60 = 108LL;
      __int16 v61 = 2114;
      id v62 = a6;
      __int16 v63 = 2050;
      uint64_t v64 = v8;
      __int16 v65 = 2082;
      v66 = "assert";
      __int16 v67 = 2081;
      v68 = "subIdentityType == kSubIdentityTypeNestedBundlePath";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v40,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#CLCKP LimitingBundleId anchors must have a subIdentity of type kSubIdentityTypeNestedBundlePath",  "{msg%{public}.0s:#CLCKP LimitingBundleId anchors must have a subIdentity of type kSubIdentityTypeNestedBun dlePath, userName:%{public, location:escape_only}@, clientAnchor:%{public, location:escape_only}@, a nchorType:%{public, location:CLClientKeyAnchorType}lld, subIdentityId:%{public, location:escape_only}@,  subIdentityType:%{public, location:CLClientKeySubIdentityType}lld, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x58u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018774E8);
      }
    }

    v10 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68290819;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = v12;
      __int16 v59 = 2050;
      uint64_t v60 = 108LL;
      __int16 v61 = 2114;
      id v62 = a6;
      __int16 v63 = 2050;
      uint64_t v64 = v8;
      __int16 v65 = 2082;
      v66 = "assert";
      __int16 v67 = 2081;
      v68 = "subIdentityType == kSubIdentityTypeNestedBundlePath";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#CLCKP LimitingBundleId anchors must have a subIdentity of type kSubIdentityTypeNestedBun dlePath, userName:%{public, location:escape_only}@, clientAnchor:%{public, location:escape_only}@, a nchorType:%{public, location:CLClientKeyAnchorType}lld, subIdentityId:%{public, location:escape_only}@,  subIdentityType:%{public, location:CLClientKeySubIdentityType}lld, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x58u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm",  216,  "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]");
    goto LABEL_113;
  }

  if (a6 && ((a7 - 101) > 0x15 || ((1 << (a7 - 101)) & 0x240811) == 0))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018774E8);
    }
    p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
    v36 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68290819;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = v12;
      __int16 v59 = 2050;
      uint64_t v60 = (int)v10;
      __int16 v61 = 2114;
      id v62 = a6;
      __int16 v63 = 2050;
      uint64_t v64 = v8;
      __int16 v65 = 2082;
      v66 = "assert";
      __int16 v67 = 2081;
      v68 = "validateCKPSubIdentityType(subIdentityType)";
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#CLCKP subIdentityType must be valid, userName:%{public, location:escape_only}@,  clientAnchor:%{public, location:escape_only}@, anchorType:%{public, location:CLClientKeyAnchorType}lld,  subIdentityId:%{public, location:escape_only}@, subIdentityType:%{public, location:CLClientKeySubIdentityT ype}lld, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x58u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018774E8);
      }
    }

    v37 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      *(_DWORD *)buf = 68290819;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = v12;
      __int16 v59 = 2050;
      uint64_t v60 = (int)v10;
      __int16 v61 = 2114;
      id v62 = a6;
      __int16 v63 = 2050;
      uint64_t v64 = v8;
      __int16 v65 = 2082;
      v66 = "assert";
      __int16 v67 = 2081;
      v68 = "validateCKPSubIdentityType(subIdentityType)";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v37,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#CLCKP subIdentityType must be valid",  "{msg%{public}.0s:#CLCKP subIdentityType must be valid, userName:%{public, location:escape_only}@,  clientAnchor:%{public, location:escape_only}@, anchorType:%{public, location:CLClientKeyAnchorType}lld,  subIdentityId:%{public, location:escape_only}@, subIdentityType:%{public, location:CLClientKeySubIdentityT ype}lld, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x58u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018774E8);
      }
    }

    v38 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68290819;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = v12;
      __int16 v59 = 2050;
      uint64_t v60 = (int)v10;
      __int16 v61 = 2114;
      id v62 = a6;
      __int16 v63 = 2050;
      uint64_t v64 = v8;
      __int16 v65 = 2082;
      v66 = "assert";
      __int16 v67 = 2081;
      v68 = "validateCKPSubIdentityType(subIdentityType)";
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#CLCKP subIdentityType must be valid, userName:%{public, location:escape_only}@,  clientAnchor:%{public, location:escape_only}@, anchorType:%{public, location:CLClientKeyAnchorType}lld,  subIdentityId:%{public, location:escape_only}@, subIdentityType:%{public, location:CLClientKeySubIdentityT ype}lld, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x58u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm",  219,  "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]");
    goto LABEL_113;
  }

  if (_os_feature_enabled_impl("CoreLocation", "cl_pula"))
  {
    if (!a3)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018774E8);
      }
      v41 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290819;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = "";
        __int16 v55 = 2114;
        id v56 = 0LL;
        __int16 v57 = 2114;
        v58 = v12;
        __int16 v59 = 2050;
        uint64_t v60 = (int)v10;
        __int16 v61 = 2114;
        id v62 = a6;
        __int16 v63 = 2050;
        uint64_t v64 = v8;
        __int16 v65 = 2082;
        v66 = "assert";
        __int16 v67 = 2081;
        v68 = "userName";
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#CLCKP initializing on cl_pula enabled devices requires userName, userName:%{publ ic, location:escape_only}@, clientAnchor:%{public, location:escape_only}@, anchorType:%{public, locati on:CLClientKeyAnchorType}lld, subIdentityId:%{public, location:escape_only}@, subIdentityType:%{public , location:CLClientKeySubIdentityType}lld, event:%{public, location:escape_only}s, condition:%{private , location:escape_only}s}",  buf,  0x58u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018774E8);
        }
      }

      v42 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        *(_DWORD *)buf = 68290819;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = "";
        __int16 v55 = 2114;
        id v56 = 0LL;
        __int16 v57 = 2114;
        v58 = v12;
        __int16 v59 = 2050;
        uint64_t v60 = (int)v10;
        __int16 v61 = 2114;
        id v62 = a6;
        __int16 v63 = 2050;
        uint64_t v64 = v8;
        __int16 v65 = 2082;
        v66 = "assert";
        __int16 v67 = 2081;
        v68 = "userName";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v42,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#CLCKP initializing on cl_pula enabled devices requires userName",  "{msg%{public}.0s:#CLCKP initializing on cl_pula enabled devices requires userName, userName:%{publ ic, location:escape_only}@, clientAnchor:%{public, location:escape_only}@, anchorType:%{public, locati on:CLClientKeyAnchorType}lld, subIdentityId:%{public, location:escape_only}@, subIdentityType:%{public , location:CLClientKeySubIdentityType}lld, event:%{public, location:escape_only}s, condition:%{private , location:escape_only}s}",  buf,  0x58u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018774E8);
        }
      }

      a3 = (id)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290819;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = "";
        __int16 v55 = 2114;
        id v56 = 0LL;
        __int16 v57 = 2114;
        v58 = v12;
        __int16 v59 = 2050;
        uint64_t v60 = (int)v10;
        __int16 v61 = 2114;
        id v62 = a6;
        __int16 v63 = 2050;
        uint64_t v64 = v8;
        __int16 v65 = 2082;
        v66 = "assert";
        __int16 v67 = 2081;
        v68 = "userName";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)a3,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#CLCKP initializing on cl_pula enabled devices requires userName, userName:%{publ ic, location:escape_only}@, clientAnchor:%{public, location:escape_only}@, anchorType:%{public, locati on:CLClientKeyAnchorType}lld, subIdentityId:%{public, location:escape_only}@, subIdentityType:%{public , location:CLClientKeySubIdentityType}lld, event:%{public, location:escape_only}s, condition:%{private , location:escape_only}s}",  buf,  0x58u);
      }

      abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm",  225,  "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]");
      goto LABEL_113;
    }

    if ((sub_100BE2ECC((uint64_t)a3) & 1) != 0)
    {
      int v13 = (char *)[a3 length];
      uint64_t v14 = 2LL;
      goto LABEL_25;
    }

    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018774E8);
    }
    uint64_t v17 = qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289794;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = v12;
      __int16 v59 = 2114;
      uint64_t v60 = (uint64_t)a6;
      v18 = "{\"msg%{public}.0s\":\"#warning CLCKP initializing with invalid user UUID. returning nullCKP\", \"userName\""
            ":%{public, location:escape_only}@, Anchor:%{public, location:escape_only}@, SubId:%{public, location:escape_only}@}";
      v19 = (os_log_s *)v17;
      uint32_t v20 = 48;
LABEL_36:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
  }

  else
  {
    if (!a3)
    {
      int v13 = 0LL;
      goto LABEL_24;
    }

    p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
    if (qword_101934980 == -1) {
      goto LABEL_13;
    }
LABEL_113:
    while (1)
    {
      dispatch_once(&qword_101934980, &stru_1018774E8);
LABEL_13:
      __int16 v15 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290306;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = "";
        __int16 v55 = 2114;
        id v56 = a3;
        __int16 v57 = 2114;
        v58 = v12;
        __int16 v59 = 2050;
        uint64_t v60 = (int)v10;
        __int16 v61 = 2114;
        id v62 = a6;
        __int16 v63 = 2050;
        uint64_t v64 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#CLCKP initializing with userName when cl_pula is disabled. Ignoring userName., use rName:%{public, location:escape_only}@, clientAnchor:%{public, location:escape_only}@, anchorType:%{ public, location:CLClientKeyAnchorType}lld, subIdentityId:%{public, location:escape_only}@, subIdentityT ype:%{public, location:CLClientKeySubIdentityType}lld}",  buf,  0x44u);
      }

      v16 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        *(_DWORD *)buf = 68290306;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = "";
        __int16 v55 = 2114;
        id v56 = a3;
        __int16 v57 = 2114;
        v58 = v12;
        __int16 v59 = 2050;
        uint64_t v60 = (int)v10;
        __int16 v61 = 2114;
        id v62 = a6;
        __int16 v63 = 2050;
        uint64_t v64 = v8;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#CLCKP initializing with userName when cl_pula is disabled. Ignoring userName.",  "{msg%{public}.0s:#CLCKP initializing with userName when cl_pula is disabled. Ignoring userName., use rName:%{public, location:escape_only}@, clientAnchor:%{public, location:escape_only}@, anchorType:%{ public, location:CLClientKeyAnchorType}lld, subIdentityId:%{public, location:escape_only}@, subIdentityT ype:%{public, location:CLClientKeySubIdentityType}lld}",  buf,  0x44u);
      }

      int v13 = 0LL;
      a3 = 0LL;
LABEL_24:
      uint64_t v14 = 1LL;
LABEL_25:
      if (!-[os_log_s length](v12, "length")) {
        break;
      }
      if (a6) {
        uint64_t v21 = 2LL;
      }
      else {
        uint64_t v21 = 1LL;
      }
      id v22 = -[os_log_s length](v12, "length");
      v23 = &v13[v14 + v21 + (unint64_t)[a6 length] + (void)v22];
      if ((unint64_t)v23 < 0x1F8)
      {
        if ((unint64_t)v23 >= 0x18)
        {
          v28 = off_1018157F8;
          v29 = off_101815810;
          uint64_t v30 = 504LL;
          if ((unint64_t)v23 < 0x78)
          {
            uint64_t v31 = 120LL;
          }

          else
          {
            v28 = v29;
            uint64_t v31 = v30;
          }

          BOOL v32 = (unint64_t)v23 >= 0x38;
          else {
            v24 = &off_101815818;
          }
          if (v32) {
            size_t v25 = v31;
          }
          else {
            size_t v25 = 56LL;
          }
        }

        else
        {
          v24 = off_101815808;
          size_t v25 = 24LL;
        }

        v27 = (char *)objc_alloc(*v24);
        strcpy((char *)buf, ":");
        __source[0] = (char)v10;
        __source[1] = 0;
        v49[0] = v8;
        v49[1] = 0;
        if (_os_feature_enabled_impl("CoreLocation", "cl_pula"))
        {
          strlcpy(v27 + 8, (const char *)[a3 UTF8String], v25);
          strlcat(v27 + 8, (const char *)buf, v25);
        }

        strlcat(v27 + 8, __source, v25);
        strlcat(v27 + 8, (const char *)-[os_log_s UTF8String](v12, "UTF8String"), v25);
        strlcat(v27 + 8, (const char *)buf, v25);
        if (a6)
        {
          strlcat(v27 + 8, v49, v25);
          strlcat(v27 + 8, (const char *)[a6 UTF8String], v25);
        }

        return (CLClientKeyPath *)v27;
      }

      p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018774E8);
      }
      v43 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290819;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = "";
        __int16 v55 = 2114;
        id v56 = a3;
        __int16 v57 = 2114;
        v58 = v12;
        __int16 v59 = 2050;
        uint64_t v60 = (int)v10;
        __int16 v61 = 2114;
        id v62 = a6;
        __int16 v63 = 2050;
        uint64_t v64 = v8;
        __int16 v65 = 2082;
        v66 = "assert";
        __int16 v67 = 2081;
        v68 = "ckp_length < kClientKeyPathMaxBufferLength";
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#CLCKP cannot init with parameters larger than the maximum 512 bytes, userName:%{ public, location:escape_only}@, clientAnchor:%{public, location:escape_only}@, anchorType:%{public, lo cation:CLClientKeyAnchorType}lld, subIdentityId:%{public, location:escape_only}@, subIdentityType:%{pu blic, location:CLClientKeySubIdentityType}lld, event:%{public, location:escape_only}s, condition:%{pri vate, location:escape_only}s}",  buf,  0x58u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018774E8);
        }
      }

      v44 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        *(_DWORD *)buf = 68290819;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = "";
        __int16 v55 = 2114;
        id v56 = a3;
        __int16 v57 = 2114;
        v58 = v12;
        __int16 v59 = 2050;
        uint64_t v60 = (int)v10;
        __int16 v61 = 2114;
        id v62 = a6;
        __int16 v63 = 2050;
        uint64_t v64 = v8;
        __int16 v65 = 2082;
        v66 = "assert";
        __int16 v67 = 2081;
        v68 = "ckp_length < kClientKeyPathMaxBufferLength";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v44,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#CLCKP cannot init with parameters larger than the maximum 512 bytes",  "{msg%{public}.0s:#CLCKP cannot init with parameters larger than the maximum 512 bytes, userName:%{ public, location:escape_only}@, clientAnchor:%{public, location:escape_only}@, anchorType:%{public, lo cation:CLClientKeyAnchorType}lld, subIdentityId:%{public, location:escape_only}@, subIdentityType:%{pu blic, location:CLClientKeySubIdentityType}lld, event:%{public, location:escape_only}s, condition:%{pri vate, location:escape_only}s}",  buf,  0x58u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018774E8);
        }
      }

      v45 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290819;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = "";
        __int16 v55 = 2114;
        id v56 = a3;
        __int16 v57 = 2114;
        v58 = v12;
        __int16 v59 = 2050;
        uint64_t v60 = (int)v10;
        __int16 v61 = 2114;
        id v62 = a6;
        __int16 v63 = 2050;
        uint64_t v64 = v8;
        __int16 v65 = 2082;
        v66 = "assert";
        __int16 v67 = 2081;
        v68 = "ckp_length < kClientKeyPathMaxBufferLength";
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#CLCKP cannot init with parameters larger than the maximum 512 bytes, userName:%{ public, location:escape_only}@, clientAnchor:%{public, location:escape_only}@, anchorType:%{public, lo cation:CLClientKeyAnchorType}lld, subIdentityId:%{public, location:escape_only}@, subIdentityType:%{pu blic, location:CLClientKeySubIdentityType}lld, event:%{public, location:escape_only}s, condition:%{pri vate, location:escape_only}s}",  buf,  0x58u);
      }

      abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm",  266,  "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]");
    }

    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018774E8);
    }
    uint64_t v26 = qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68290306;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2114;
      id v56 = a3;
      __int16 v57 = 2114;
      v58 = v12;
      __int16 v59 = 2050;
      uint64_t v60 = (int)v10;
      __int16 v61 = 2114;
      id v62 = a6;
      __int16 v63 = 2050;
      uint64_t v64 = v8;
      v18 = "{msg%{public}.0s:#Warning #CLCKP initialization must include non-empty anchor. Returning nullClientKey"
            "Path\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \""
            "anchorType:%{public, location:CLClientKeyAnchorType}lld, subIdentityId:%{public, location:escape_only}"
            "@, subIdentityType:%{public, location:CLClientKeySubIdentityType}lld}";
      v19 = (os_log_s *)v26;
      uint32_t v20 = 68;
      goto LABEL_36;
    }
  }

  return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath");
}

+ (CLClientKeyPath)clientKeyPathWithUserName:(id)a3 clientAnchor:(id)a4 anchorType:(char)a5
{
  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:",  a3,  a4,  a5,  0LL,  33LL);
}

+ (CLClientKeyPath)clientKeyPathWithClientAnchor:(id)a3 anchorType:(char)a4 subIdentityId:(id)a5 subIdentityType:(char)a6
{
  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:",  0LL,  a3,  a4,  a5,  a6);
}

+ (CLClientKeyPath)clientKeyPathWithClientAnchor:(id)a3 anchorType:(char)a4
{
  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:",  0LL,  a3,  a4,  0LL,  33LL);
}

+ (id)clientKeyPathFromName:(id)a1 subIdentityId:(SEL)a2 subIdentityType:(Name *)a3
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  if (_os_feature_enabled_impl("CoreLocation", "cl_pula"))
  {
    if (*((char *)&a3->fUserName.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_1010DD48C(__p, a3->fUserName.__r_.__value_.var0.var1.__data_, a3->fUserName.__r_.__value_.var0.var1.__size_);
    }

    else
    {
      *(_OWORD *)__p = *(_OWORD *)a3->fUserName.__r_.__value_.var0.var0.__data_;
      uint64_t v17 = *((void *)&a3->fUserName.__r_.__value_.var0.var1 + 2);
    }

    if (v17 >= 0) {
      int v9 = __p;
    }
    else {
      int v9 = (void **)__p[0];
    }
    int v8 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9, __p[0], __p[1], v17);
    if (SHIBYTE(v17) < 0) {
      operator delete(__p[0]);
    }
  }

  else
  {
    int v8 = 0LL;
  }

  sub_100FE3D60((uint64_t)a3, (uint64_t)__p);
  if (v17 >= 0) {
    v10 = __p;
  }
  else {
    v10 = (void **)__p[0];
  }
  v11 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
  if (-[NSString hasPrefix:]( v11,  "hasPrefix:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.locationd.executable-")))
  {
    p_var0 = &a3->fUserName.__r_.var0;
    if (a3[1].fUserName.__r_.__value_.var0.var0.__data_[7] < 0) {
      p_var0 = *(int **)p_var0;
    }
    v11 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_var0);
    uint64_t v13 = 101LL;
  }

  else if (-[NSString hasPrefix:]( v11,  "hasPrefix:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.locationd.bundle-")))
  {
    p_size = &a3[1].fUserName.__r_.__value_.var0.var1.__size_;
    v11 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_size);
    uint64_t v13 = 112LL;
  }

  else
  {
    uint64_t v13 = 105LL;
  }

  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:",  v8,  v11,  v13,  v6,  v5);
}

+ (id)clientKeyPathFromName:(Name *)a3
{
  id v3 = +[CLClientKeyPath clientKeyPathFromName:subIdentityId:subIdentityType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathFromName:subIdentityId:subIdentityType:",  __dst,  0LL,  33LL);
  if (v18 < 0) {
    operator delete(__p);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7);
  }
  if (v6 < 0) {
    operator delete(__dst[0]);
  }
  return v3;
}

+ (CLClientKeyPath)clientKeyPathWithClientKey:(id)a3
{
  if (objc_msgSend( a3,  "isEqualToString:",  objc_msgSend( +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath"),  "clientKey"))) {
    return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath");
  }
  id v5 = [a3 componentsSeparatedByString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%c", 58)];
  int v6 = _os_feature_enabled_impl("CoreLocation", "cl_pula");
  id v7 = [v5 count];
  if (!v6)
  {
    if (v7 == (id)2)
    {
      if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "length")) {
        id v9 = [v5 objectAtIndexedSubscript:0];
      }
      else {
        id v9 = 0LL;
      }
      uint64_t v11 = 1LL;
      id v8 = 0LL;
      id v12 = 0LL;
      uint64_t v13 = 2LL;
      if (!objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "length"))
      {
LABEL_23:
        if (v9) {
          goto LABEL_24;
        }
LABEL_27:
        signed __int8 v14 = 33;
        if (v12) {
          goto LABEL_25;
        }
        goto LABEL_28;
      }

+ (CLClientKeyPath)clientKeyPathWithLegacyClientKey:(id)a3
{
  if (v17 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  id v5 = objc_msgSend( a3,  "componentsSeparatedByString:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  int v6 = _os_feature_enabled_impl("CoreLocation", "cl_pula");
  id v7 = [v5 count];
  if (!v6)
  {
    if (v7 == (id)1)
    {
      if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "length"))
      {
        id v9 = [v5 objectAtIndexedSubscript:0];
        id v8 = 0LL;
      }

      else
      {
        id v8 = 0LL;
        id v9 = 0LL;
      }

      goto LABEL_19;
    }

    goto LABEL_27;
  }

  if (v7 != (id)2)
  {
    sub_101265280(a3);
LABEL_27:
    sub_1012653F0(a3);
LABEL_28:
    signed __int8 v15 = (_Unwind_Exception *)sub_101265110(a3);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
    _Unwind_Resume(v15);
  }

  if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "length")) {
    id v8 = [v5 objectAtIndexedSubscript:0];
  }
  else {
    id v8 = 0LL;
  }
  if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "length")) {
    id v9 = [v5 objectAtIndexedSubscript:1];
  }
  else {
    id v9 = 0LL;
  }
LABEL_19:
  if (objc_msgSend( v9,  "hasPrefix:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  "com.apple.locationd.bundle-")))
  {
    uint64_t v10 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.locationd.bundle-");
    uint64_t v11 = 112LL;
  }

  else
  {
    if (!objc_msgSend( v9,  "hasPrefix:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  "com.apple.locationd.executable-")))
    {
      uint64_t v11 = 105LL;
      return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithUserName:clientAnchor:anchorType:",  v8,  v9,  v11);
    }

    uint64_t v10 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.locationd.executable-");
    uint64_t v11 = 101LL;
  }

  id v12 = (char *)[v9 rangeOfString:v10];
  id v9 = [v9 substringFromIndex:&v12[v13]];
  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithUserName:clientAnchor:anchorType:",  v8,  v9,  v11);
}

- (BOOL)isValidCKP
{
  return +[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath") != self;
}

- (CLClientKeyPath)clientKeyPathWithReplacementSubIdentityId:(id)a3 subIdentityType:(char)a4
{
  uint64_t v4 = a4;
  if (![a3 length]) {
    return self;
  }
  if ((v4 - 101) > 0x15 || ((1 << (v4 - 101)) & 0x240811) == 0)
  {
    if (qword_101934980 != -1) {
      goto LABEL_16;
    }
    while (1)
    {
      id v9 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290307;
        int v13 = 0;
        __int16 v14 = 2082;
        signed __int8 v15 = "";
        __int16 v16 = 2114;
        char v17 = self;
        __int16 v18 = 2114;
        id v19 = a3;
        __int16 v20 = 1026;
        int v21 = v4;
        __int16 v22 = 2082;
        __int16 v23 = "assert";
        __int16 v24 = 2081;
        size_t v25 = "validateCKPSubIdentityType(subIdentityType)";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Attempted to create #CLCKP with invalid replacement subIdentity type., originalCKP :%{public, location:escape_only}@, subId:%{public, location:escape_only}@, subIdTypeChar:%{public}d,  event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x40u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018774E8);
        }
      }

      uint64_t v10 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        *(_DWORD *)buf = 68290307;
        int v13 = 0;
        __int16 v14 = 2082;
        signed __int8 v15 = "";
        __int16 v16 = 2114;
        char v17 = self;
        __int16 v18 = 2114;
        id v19 = a3;
        __int16 v20 = 1026;
        int v21 = v4;
        __int16 v22 = 2082;
        __int16 v23 = "assert";
        __int16 v24 = 2081;
        size_t v25 = "validateCKPSubIdentityType(subIdentityType)";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Attempted to create #CLCKP with invalid replacement subIdentity type.",  "{msg%{public}.0s:Attempted to create #CLCKP with invalid replacement subIdentity type., originalCKP :%{public, location:escape_only}@, subId:%{public, location:escape_only}@, subIdTypeChar:%{public}d,  event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x40u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018774E8);
        }
      }

      uint64_t v11 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290307;
        int v13 = 0;
        __int16 v14 = 2082;
        signed __int8 v15 = "";
        __int16 v16 = 2114;
        char v17 = self;
        __int16 v18 = 2114;
        id v19 = a3;
        __int16 v20 = 1026;
        int v21 = v4;
        __int16 v22 = 2082;
        __int16 v23 = "assert";
        __int16 v24 = 2081;
        size_t v25 = "validateCKPSubIdentityType(subIdentityType)";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Attempted to create #CLCKP with invalid replacement subIdentity type., originalCKP :%{public, location:escape_only}@, subId:%{public, location:escape_only}@, subIdTypeChar:%{public}d,  event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x40u);
      }

      abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm",  501,  "-[CLClientKeyPath clientKeyPathWithReplacementSubIdentityId:subIdentityType:]");
LABEL_16:
      dispatch_once(&qword_101934980, &stru_1018774E8);
    }
  }

  id v8 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1LL);
  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:",  -[CLClientKeyPath userName](self, "userName"),  -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v8 + 1),  *v8,  a3,  v4);
}

- (CLClientKeyPath)clientKeyPathWithReplacementAnchor:(id)a3 anchorType:(char)a4
{
  uint64_t v4 = a4;
  if ((a4 - 101) > 0xB || ((1 << (a4 - 101)) & 0x891) == 0)
  {
    if (qword_101934980 != -1) {
      goto LABEL_19;
    }
    while (1)
    {
      int v13 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290307;
        int v17 = 0;
        __int16 v18 = 2082;
        id v19 = "";
        __int16 v20 = 2114;
        int v21 = self;
        __int16 v22 = 2114;
        id v23 = a3;
        __int16 v24 = 1026;
        int v25 = v4;
        __int16 v26 = 2082;
        v27 = "assert";
        __int16 v28 = 2081;
        v29 = "validateCKPAnchorType(anchorType)";
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Attempted to create #CLCKP with either an empty clientAnchor or an invalid replacement anchor type., originalCKP:%{public, location:escape_only}@, anchor:%{public, location:escape_only}@, anchorTypeChar:%{public}d, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x40u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018774E8);
        }
      }

      __int16 v14 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        *(_DWORD *)buf = 68290307;
        int v17 = 0;
        __int16 v18 = 2082;
        id v19 = "";
        __int16 v20 = 2114;
        int v21 = self;
        __int16 v22 = 2114;
        id v23 = a3;
        __int16 v24 = 1026;
        int v25 = v4;
        __int16 v26 = 2082;
        v27 = "assert";
        __int16 v28 = 2081;
        v29 = "validateCKPAnchorType(anchorType)";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Attempted to create #CLCKP with either an empty clientAnchor or an invalid replacement anchor type.",  "{msg%{public}.0s:Attempted to create #CLCKP with either an empty clientAnchor or an invalid replacement anchor type., originalCKP:%{public, location:escape_only}@, anchor:%{public, location:escape_only}@, anchorTypeChar:%{public}d, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x40u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018774E8);
        }
      }

      signed __int8 v15 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290307;
        int v17 = 0;
        __int16 v18 = 2082;
        id v19 = "";
        __int16 v20 = 2114;
        int v21 = self;
        __int16 v22 = 2114;
        id v23 = a3;
        __int16 v24 = 1026;
        int v25 = v4;
        __int16 v26 = 2082;
        v27 = "assert";
        __int16 v28 = 2081;
        v29 = "validateCKPAnchorType(anchorType)";
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Attempted to create #CLCKP with either an empty clientAnchor or an invalid replacement anchor type., originalCKP:%{public, location:escape_only}@, anchor:%{public, location:escape_only}@, anchorTypeChar:%{public}d, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x40u);
      }

      abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm",  512,  "-[CLClientKeyPath clientKeyPathWithReplacementAnchor:anchorType:]");
LABEL_19:
      dispatch_once(&qword_101934980, &stru_1018774E8);
    }
  }

  id v8 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (v8)
  {
    id v9 = v8;
    id v10 = -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v8 + 1);
    char v11 = *v9;
  }

  else
  {
    id v10 = 0LL;
    char v11 = 33;
  }

  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:",  -[CLClientKeyPath userName](self, "userName"),  a3,  v4,  v10,  v11);
}

- (CLClientKeyPath)clientKeyPathWithReplacementTypedSubIdentityId:(id)a3
{
  if (![a3 length]) {
    return self;
  }
  id v6 = [a3 substringFromIndex:1];
  id v7 = (char *)[a3 UTF8String];
  if ((*v7 - 101) > 0x15 || ((1 << (*v7 - 101)) & 0x240811) == 0)
  {
    char v11 = (CLClientKeyPath *)sub_101265560(a3);
    return -[CLClientKeyPath clientKeyPathWithReplacementTypedAnchor:](v11, v12, v13);
  }

  else
  {
    char v9 = *v7;
    id v10 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1LL);
    return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:",  -[CLClientKeyPath userName](self, "userName"),  -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v10 + 1),  *v10,  v6,  v9);
  }

- (CLClientKeyPath)clientKeyPathWithReplacementTypedAnchor:(id)a3
{
  id v5 = [a3 substringFromIndex:1];
  id v6 = [a3 UTF8String];
  int v7 = (char)*v6;
  if ((v7 - 101) > 0xB || ((1 << (*v6 - 101)) & 0x891) == 0)
  {
    if (qword_101934980 != -1) {
      goto LABEL_19;
    }
    while (1)
    {
      __int16 v14 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290051;
        int v18 = 0;
        __int16 v19 = 2082;
        __int16 v20 = "";
        __int16 v21 = 2114;
        __int16 v22 = self;
        __int16 v23 = 2114;
        id v24 = a3;
        __int16 v25 = 2082;
        __int16 v26 = "assert";
        __int16 v27 = 2081;
        __int16 v28 = "validateCKPAnchorType(anchorType)";
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Attempted to create #CLCKP with invalid replacement typed-anchor., originalCKP:%{ public, location:escape_only}@, anchorWithType:%{public, location:escape_only}@, event:%{public, locat ion:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x3Au);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018774E8);
        }
      }

      signed __int8 v15 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        *(_DWORD *)buf = 68290051;
        int v18 = 0;
        __int16 v19 = 2082;
        __int16 v20 = "";
        __int16 v21 = 2114;
        __int16 v22 = self;
        __int16 v23 = 2114;
        id v24 = a3;
        __int16 v25 = 2082;
        __int16 v26 = "assert";
        __int16 v27 = 2081;
        __int16 v28 = "validateCKPAnchorType(anchorType)";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Attempted to create #CLCKP with invalid replacement typed-anchor.",  "{msg%{public}.0s:Attempted to create #CLCKP with invalid replacement typed-anchor., originalCKP:%{ public, location:escape_only}@, anchorWithType:%{public, location:escape_only}@, event:%{public, locat ion:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x3Au);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018774E8);
        }
      }

      __int16 v16 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290051;
        int v18 = 0;
        __int16 v19 = 2082;
        __int16 v20 = "";
        __int16 v21 = 2114;
        __int16 v22 = self;
        __int16 v23 = 2114;
        id v24 = a3;
        __int16 v25 = 2082;
        __int16 v26 = "assert";
        __int16 v27 = 2081;
        __int16 v28 = "validateCKPAnchorType(anchorType)";
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Attempted to create #CLCKP with invalid replacement typed-anchor., originalCKP:%{ public, location:escape_only}@, anchorWithType:%{public, location:escape_only}@, event:%{public, locat ion:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x3Au);
      }

      abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm",  545,  "-[CLClientKeyPath clientKeyPathWithReplacementTypedAnchor:]");
LABEL_19:
      dispatch_once(&qword_101934980, &stru_1018774E8);
    }
  }

  char v9 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (v9)
  {
    id v10 = v9;
    id v11 = -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v9 + 1);
    char v12 = *v10;
  }

  else
  {
    id v11 = 0LL;
    char v12 = 33;
  }

  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:",  -[CLClientKeyPath userName](self, "userName"),  v5,  (char)v7,  v11,  v12);
}

- (CLClientKeyPath)anchorKeyPath
{
  if (-[CLClientKeyPath isAuthLimited](self, "isAuthLimited")) {
    return self;
  }
  id v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (!v3) {
    return self;
  }
  else {
    return +[CLClientKeyPath clientKeyPathWithClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithClientKey:",   -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  self->_buffer,  v3 - self->_buffer,  4LL));
  }
}

- (basic_string<char,)cppClientKey
{
  v2 = v1;
  uint64_t v4 = [v1 findComponent:2];
  if (!v4) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1010DDBC0(retstr, v2 + 8);
  }
  id v5 = v4;
  if (*v4 != 119) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1010DDBC0(retstr, v2 + 8);
  }
  _BYTE *v4 = 0;
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1010DDBC0(retstr, v2 + 8);
  *id v5 = 119;
  return result;
}

- (NSString)legacyClientKey
{
  id v3 = -[CLClientKeyPath userName](self, "userName");
  uint64_t v4 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1LL);
  int v5 = *v4;
  id v6 = -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v4 + 1);
  int v7 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (v7)
  {
    id v8 = v7;
    char v9 = -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v7 + 1);
    int v10 = *v8;
    switch(v10)
    {
      case 'e':
        id v11 = &off_1018937F0;
        goto LABEL_11;
      case 'i':
        goto LABEL_16;
      case 'p':
        id v11 = &off_1018937F8;
LABEL_11:
        id v13 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s%@", *v11, v9);
LABEL_15:
        char v9 = v13;
LABEL_16:
        if (!v3) {
          return v9;
        }
        goto LABEL_17;
    }
  }

  switch(v5)
  {
    case '!':
      id v13 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.locationd.executable-");
      goto LABEL_15;
    case 'e':
      char v12 = &off_1018937F0;
      goto LABEL_14;
    case 'p':
      char v12 = &off_1018937F8;
LABEL_14:
      id v13 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s%@", *v12, v6);
      goto LABEL_15;
  }

  char v9 = v6;
  if (!v3) {
    return v9;
  }
LABEL_17:
  sub_100FE36E4(__p);
  if (v17 >= 0) {
    __int16 v14 = __p;
  }
  else {
    __int16 v14 = (void **)__p[0];
  }
  char v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%s%@", v3, v14, v9);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  return v9;
}

- (Name)clientName
{
  v2 = v1;
  *(_DWORD *)((char *)&retstr[2].fUserName.__r_.__value_.var0.var1.__size_ + 7) = 0;
  *(_OWORD *)&retstr[1].fUserName.__r_.var0 = 0u;
  *(_OWORD *)retstr[2].fUserName.__r_.__value_.var0.var0.__data_ = 0u;
  *(_OWORD *)&retstr->fUserName.var0 = 0u;
  *(_OWORD *)&retstr[1].fUserName.__r_.__value_.var0.var1.__size_ = 0u;
  *(_OWORD *)retstr->fUserName.__r_.__value_.var0.var0.__data_ = 0u;
  *((_OWORD *)&retstr->fUserName.__r_.__value_.var0.var1 + 1) = 0u;
  *(_OWORD *)&retstr[2].fUserName.__r_.var0 = 0u;
  *(_OWORD *)retstr[3].fUserName.__r_.__value_.var0.var0.__data_ = 0u;
  *((_OWORD *)&retstr[3].fUserName.__r_.__value_.var0.var1 + 1) = 0u;
  *(_OWORD *)&retstr[3].fUserName.var0 = 0u;
  *(__long *)((char *)&retstr[4].fUserName.__r_.__value_.var0.var1 + 3) = 0u;
  int v4 = *(unsigned __int8 *)[v1 findComponent:1];
  id v5 = [v2 clientAnchor];
  id v6 = (unsigned __int8 *)[v2 findComponent:2];
  if (!v6)
  {
    if (v5) {
      goto LABEL_23;
    }
LABEL_27:
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018774E8);
    }
    int v10 = (os_log_s *)qword_101934988;
    if (!os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    uint64_t __str = 68289282LL;
    __int16 __str_8 = 2082;
    __str_10 = "";
    __int16 __str_18 = 2114;
    *(void *)__str_20 = v2;
    id v11 = "{msg%{public}.0s:#warning #CLCKP creating Name from ckp with an empty anchor, CKP:%{public, locati"
          "on:escape_only}@}";
LABEL_38:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&__str, 0x1Cu);
    goto LABEL_65;
  }

  int v7 = *v6;
  id v8 = [v2 subIdentityId];
  if (!v5) {
    goto LABEL_27;
  }
  if (v7 == 112)
  {
    if (v8)
    {
      if (v4 == 108)
      {
        sub_1010DDBC0(&v17, (char *)[v8 UTF8String]);
        sub_1010DDBC0(&v16, (char *)[v5 UTF8String]);
        sub_100FE2EAC(&v17, &v16, (std::string *)&__str);
        sub_1011DBE2C((uint64_t)retstr, (__int128 *)&__str);
        if (v33 < 0) {
          operator delete(__p);
        }
        if (v31 < 0) {
          operator delete(v30);
        }
        if (v29 < 0) {
          operator delete(v28);
        }
        if (v27 < 0) {
          operator delete(v26);
        }
        if (v25 < 0) {
          operator delete(v24);
        }
        if (v23 < 0) {
          operator delete(*(void **)&__str_20[4]);
        }
        if ((__str_20[3] & 0x80000000) != 0) {
          operator delete((void *)__str);
        }
        char v9 = (void *)v16.__r_.__value_.__r.__words[0];
LABEL_61:
        operator delete(v9);
LABEL_62:
        char v12 = (void *)v17.__r_.__value_.__r.__words[0];
        goto LABEL_64;
      }

      sub_1010DDBC0(&v17, (char *)[v8 UTF8String]);
      sub_100FE2DDC(&v17, (uint64_t)&__str);
LABEL_47:
      sub_1011DBE2C((uint64_t)retstr, (__int128 *)&__str);
      if (v33 < 0) {
        operator delete(__p);
      }
      if (v31 < 0) {
        operator delete(v30);
      }
      if (v29 < 0) {
        operator delete(v28);
      }
      if (v27 < 0) {
        operator delete(v26);
      }
      if (v25 < 0) {
        operator delete(v24);
      }
      if (v23 < 0) {
        operator delete(*(void **)&__str_20[4]);
      }
      if ((__str_20[3] & 0x80000000) == 0) {
        goto LABEL_62;
      }
      char v9 = (void *)__str;
      goto LABEL_61;
    }

    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018774E8);
    }
    id v13 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      uint64_t __str = 68289282LL;
      __int16 __str_8 = 2082;
      __str_10 = "";
      __int16 __str_18 = 2114;
      *(void *)__str_20 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#CLCKP creating Name from ckp which has SubIdentityTypeNestedBundlePath, but empty subId , CKP:%{public, location:escape_only}@}",  (uint8_t *)&__str,  0x1Cu);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018774E8);
      }
    }

    __int16 v14 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      uint64_t __str = 68289282LL;
      __int16 __str_8 = 2082;
      __str_10 = "";
      __int16 __str_18 = 2114;
      *(void *)__str_20 = v2;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#CLCKP creating Name from ckp which has SubIdentityTypeNestedBundlePath, but empty subId",  "{msg%{public}.0s:#CLCKP creating Name from ckp which has SubIdentityTypeNestedBundlePath, but empty subId , CKP:%{public, location:escape_only}@}",  (uint8_t *)&__str,  0x1Cu);
    }

    goto LABEL_65;
  }

- (NSString)clientKey
{
  id v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (!v3) {
    return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", self->_buffer);
  }
  int v4 = v3;
  if (*v3 != 119) {
    return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", self->_buffer);
  }
  *id v3 = 0;
  result = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", self->_buffer);
  char *v4 = 119;
  return result;
}

- (NSString)userName
{
  if (_os_feature_enabled_impl("CoreLocation", "cl_pula")) {
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:]( self,  "extractComponentFromCharPtr:",  -[CLClientKeyPath findComponent:](self, "findComponent:", 0LL));
  }
  else {
    return 0LL;
  }
}

- (NSString)clientAnchor
{
  return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:]( self,  "extractComponentFromCharPtr:",  -[CLClientKeyPath findComponent:](self, "findComponent:", 1LL) + 1);
}

- (char)anchorType
{
  return *-[CLClientKeyPath findComponent:](self, "findComponent:", 1LL);
}

- (NSString)clientAnchorWithType
{
  return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:]( self,  "extractComponentFromCharPtr:",  -[CLClientKeyPath findComponent:](self, "findComponent:", 1LL));
}

- (NSString)bundleId
{
  id v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1LL);
  if (*v3 == 105) {
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  }
  else {
    return 0LL;
  }
}

- (NSString)bundlePath
{
  id v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1LL);
  if (*v3 == 112) {
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  }
  else {
    return 0LL;
  }
}

- (NSString)executablePath
{
  id v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1LL);
  if (*v3 == 101) {
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  }
  else {
    return 0LL;
  }
}

- (NSString)subIdentityId
{
  result = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (result) {
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:]( self,  "extractComponentFromCharPtr:",  (char *)result + 1);
  }
  return result;
}

- (char)subIdentityType
{
  v2 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (v2) {
    return *v2;
  }
  else {
    return 33;
  }
}

- (NSString)subIdentityIdWithType
{
  result = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (result) {
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", result);
  }
  return result;
}

- (NSString)website
{
  id v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (v3 && *v3 == 119) {
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  }
  else {
    return 0LL;
  }
}

- (NSString)zoneId
{
  id v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (v3 && *v3 == 122) {
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  }
  else {
    return 0LL;
  }
}

- (NSString)nestedBundleId
{
  id v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (v3 && *v3 == 105) {
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  }
  else {
    return 0LL;
  }
}

- (NSString)nestedBundlePath
{
  id v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (v3 && *v3 == 112) {
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  }
  else {
    return 0LL;
  }
}

- (NSString)nestedExecutablePath
{
  id v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (v3 && *v3 == 101) {
    return (NSString *)-[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1);
  }
  else {
    return 0LL;
  }
}

- (BOOL)isAuthSharingSubIdentity
{
  if (*-[CLClientKeyPath findComponent:](self, "findComponent:", 1LL) == 108) {
    goto LABEL_5;
  }
  id v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  if (v3)
  {
    unsigned int v4 = *v3 - 101;
    if (v4 <= 0xB)
    {
      LODWORD(v3) = (0x811u >> v4) & 1;
      return (char)v3;
    }

- (BOOL)isAuthLimited
{
  return *-[CLClientKeyPath findComponent:](self, "findComponent:", 1LL) == 108;
}

- (CLClientKeyPath)limitingCKP
{
  id v3 = -[CLClientKeyPath findComponent:](self, "findComponent:", 1LL);
  if (*v3 == 108) {
    return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithUserName:clientAnchor:anchorType:",  -[CLClientKeyPath userName](self, "userName"),  -[CLClientKeyPath extractComponentFromCharPtr:](self, "extractComponentFromCharPtr:", v3 + 1),  105LL);
  }
  else {
    return 0LL;
  }
}

- (NSString)userlessClientKeyPath
{
  return +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  -[CLClientKeyPath findComponent:](self, "findComponent:", 1LL));
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v21 = v7;
  uint64_t v22 = v5;
  uint64_t v23 = v4;
  uint64_t v24 = v3;
  objc_opt_class(&OBJC_CLASS___CLClientKeyPath);
  if ((objc_opt_isKindOfClass(a3, v13) & 1) == 0) {
    return 0;
  }
  __int16 v14 = -[CLClientKeyPath findComponent:](self, "findComponent:", 2LL);
  signed __int8 v15 = v14;
  if (v14 && *v14 == 119)
  {
    *__int16 v14 = 0;
    int v16 = 1;
  }

  else
  {
    int v16 = 0;
  }

  int v18 = objc_msgSend(a3, "findComponent:", 2, v8, v21, v6, v22, v23, v24, v9, v10);
  __int16 v19 = v18;
  if (v18 && *v18 == 119)
  {
    _BYTE *v18 = 0;
    int v20 = 1;
  }

  else
  {
    int v20 = 0;
  }

  BOOL result = strcmp(self->_buffer, (const char *)a3 + 8) == 0;
  if (v16) {
    *signed __int8 v15 = 119;
  }
  if (v20) {
    _BYTE *v19 = 119;
  }
  return result;
}

- (unint64_t)hash
{
  LOBYTE(v2) = self->_buffer[0];
  if (!(_BYTE)v2) {
    return 0LL;
  }
  unint64_t result = 0LL;
  uint64_t v5 = &self->_buffer[1];
  do
  {
    int v6 = v2;
    unint64_t result = 2 * (result + (char)v2);
    int v7 = *v5++;
    int v2 = v7;
    BOOL v9 = v6 == 58 && v2 == 119;
    if (v2) {
      BOOL v10 = !v9;
    }
    else {
      BOOL v10 = 0;
    }
  }

  while (v10);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (char *)objc_alloc((Class)objc_opt_class(self));
  strcpy(v4 + 8, self->_buffer);
  return v4;
}

- (id)description
{
  return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", self->_buffer);
}

@end