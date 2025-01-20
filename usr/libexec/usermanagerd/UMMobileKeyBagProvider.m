@interface UMMobileKeyBagProvider
- (int)createPersonaKeyForUser:(unsigned int)a3 personaUUID:(id)a4 passcode:(id)a5 homeDir:(id)a6;
- (int)removePersonaKeyForUser:(unsigned int)a3 personaUUID:(id)a4 volumeUUID:(id)a5;
- (int)setVolumePath:(id)a3 forPersona:(id)a4;
@end

@implementation UMMobileKeyBagProvider

- (int)createPersonaKeyForUser:(unsigned int)a3 personaUUID:(id)a4 passcode:(id)a5 homeDir:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a4;
  id v10 = a6;
  int PersonaKeyForUser = MKBUserSessionCreatePersonaKeyForUser(0LL, v8, a5, v9, v10);
  if (PersonaKeyForUser)
  {
    if (qword_1000DBC48 != -1) {
      dispatch_once(&qword_1000DBC48, &stru_1000CDBE8);
    }
    v12 = (os_log_s *)(id)qword_1000DBC40;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = 0LL;
      unsigned int v13 = sub_100053B4C(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v13 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        int v21 = 67109890;
        int v22 = v8;
        __int16 v23 = 2114;
        id v24 = v9;
        __int16 v25 = 2114;
        id v26 = v10;
        __int16 v27 = 1024;
        int v28 = PersonaKeyForUser;
        v15 = (const char *)_os_log_send_and_compose_impl( v14,  &v20,  0LL,  0LL,  &_mh_execute_header,  v12,  16LL,  "MKBUserSessionCreatePersonaKeyForUser(%u, %{public}@, %{public}@) failed: %{darwin.errno}d",  &v21,  34);
        goto LABEL_18;
      }

      goto LABEL_20;
    }
  }

  else
  {
    if (qword_1000DBC48 != -1) {
      dispatch_once(&qword_1000DBC48, &stru_1000CDBE8);
    }
    v12 = (os_log_s *)(id)qword_1000DBC40;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = 0LL;
      unsigned int v16 = sub_100053B4C(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = v16 & 0xFFFFFFFE;
      }
      if ((_DWORD)v17)
      {
        int v21 = 67109634;
        int v22 = v8;
        __int16 v23 = 2114;
        id v24 = v9;
        __int16 v25 = 2114;
        id v26 = v10;
        v15 = (const char *)_os_log_send_and_compose_impl( v17,  &v20,  0LL,  0LL,  &_mh_execute_header,  v12,  2LL,  "MKBUserSessionCreatePersonaKeyForUser(%u, %{public}@, %{public}@)",  &v21,  28);
LABEL_18:
        v18 = (char *)v15;
        if (v15) {
          sub_100053B7C(v15);
        }
        goto LABEL_21;
      }

- (int)removePersonaKeyForUser:(unsigned int)a3 personaUUID:(id)a4 volumeUUID:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    v29 = @"MKBUserSessionVolumeUUID";
    id v30 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
  }

  else
  {
    id v10 = 0LL;
  }

  int v11 = MKBUserSessionRemovePersonaKeyForUser(v10, v6, v7);
  if (v11)
  {
    if (qword_1000DBC48 != -1) {
      dispatch_once(&qword_1000DBC48, &stru_1000CDBE8);
    }
    v12 = (os_log_s *)(id)qword_1000DBC40;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = 0LL;
      unsigned int v13 = sub_100053B4C(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v13 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        int v21 = 67109890;
        int v22 = v6;
        __int16 v23 = 2114;
        id v24 = v7;
        __int16 v25 = 2114;
        id v26 = v9;
        __int16 v27 = 1024;
        int v28 = v11;
        v15 = (const char *)_os_log_send_and_compose_impl( v14,  &v20,  0LL,  0LL,  &_mh_execute_header,  v12,  16LL,  "MKBUserSessionRemovePersonaKeyForUser(%u, %{public}@, %{public}@) failed: %{darwin.errno}d",  &v21,  34);
        goto LABEL_21;
      }

      goto LABEL_23;
    }
  }

  else
  {
    if (qword_1000DBC48 != -1) {
      dispatch_once(&qword_1000DBC48, &stru_1000CDBE8);
    }
    v12 = (os_log_s *)(id)qword_1000DBC40;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = 0LL;
      unsigned int v16 = sub_100053B4C(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = v16 & 0xFFFFFFFE;
      }
      if ((_DWORD)v17)
      {
        int v21 = 67109634;
        int v22 = v6;
        __int16 v23 = 2114;
        id v24 = v7;
        __int16 v25 = 2114;
        id v26 = v9;
        v15 = (const char *)_os_log_send_and_compose_impl( v17,  &v20,  0LL,  0LL,  &_mh_execute_header,  v12,  2LL,  "MKBUserSessionRemovePersonaKeyForUser(%u, %{public}@, %{public}@)",  &v21,  28);
LABEL_21:
        v18 = (char *)v15;
        if (v15) {
          sub_100053B7C(v15);
        }
        goto LABEL_24;
      }

- (int)setVolumePath:(id)a3 forPersona:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = MKBUserSessionSetVolumeToPersona(v5, v6);
  if (v7)
  {
    if (qword_1000DBC48 != -1) {
      dispatch_once(&qword_1000DBC48, &stru_1000CDBE8);
    }
    id v8 = (os_log_s *)(id)qword_1000DBC40;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = 0LL;
      unsigned int v9 = sub_100053B4C(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v9 & 0xFFFFFFFE;
      }
      if ((_DWORD)v10)
      {
        int v17 = 138543874;
        id v18 = v5;
        __int16 v19 = 2114;
        id v20 = v6;
        __int16 v21 = 1024;
        int v22 = v7;
        int v11 = (const char *)_os_log_send_and_compose_impl( v10,  &v16,  0LL,  0LL,  &_mh_execute_header,  v8,  16LL,  "MKBUserSessionSetVolumeToPersona(%{public}@, %{public}@) failed: %d",  &v17,  28);
        goto LABEL_18;
      }

      goto LABEL_20;
    }
  }

  else
  {
    if (qword_1000DBC48 != -1) {
      dispatch_once(&qword_1000DBC48, &stru_1000CDBE8);
    }
    id v8 = (os_log_s *)(id)qword_1000DBC40;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = 0LL;
      unsigned int v12 = sub_100053B4C(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = v12 & 0xFFFFFFFE;
      }
      if ((_DWORD)v13)
      {
        int v17 = 138543618;
        id v18 = v5;
        __int16 v19 = 2114;
        id v20 = v6;
        int v11 = (const char *)_os_log_send_and_compose_impl( v13,  &v16,  0LL,  0LL,  &_mh_execute_header,  v8,  2LL,  "MKBUserSessionSetVolumeToPersona(%{public}@, %{public}@)",  &v17,  22);
LABEL_18:
        uint64_t v14 = (char *)v11;
        if (v11) {
          sub_100053B7C(v11);
        }
        goto LABEL_21;
      }

@end