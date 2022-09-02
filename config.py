#!/usr/bin/env python3

import logging
import json
import os
from typing import NewType, Optional

_StrDict = NewType('_StrDict', dict[str, str])

PUBLIC_CONFIG_FP = 'public_config.json'
LOCAL_CONFIG_FP = 'local_config.json'


class Config:
    MYSQL_IP = 'mysql_ip'
    MYSQL_USER = 'mysql_user'
    MYSQL_PASSWORD = 'mysql_password'

    def __init__(self,
                 public_dict: _StrDict,
                 local_dict: Optional[_StrDict] = None):
        self._dict = {}
        for key, val in public_dict.items():
            self._dict[key] = val
        if local_dict:
            for key, val in local_dict.items():
                if key in self._dict:
                    logging.debug('Config: Overriding public keyval %s' % key)
                self._dict[key] = val
        self._validate_keys()

    def get(self, key: str) -> str:
        """Return a config key."""
        return self._dict[key]

    def set(self, key: str, val: str):
        """Set a config key."""
        self._dict[key] = val

    def has_key(self, key: str):
        return key in self._dict

    def _validate_keys(self):
        """Ensure that the config keys conform to expectations."""
        mandatory_keys = ('mysql_ip', 'mysql_user', 'mysql_password')
        missing_keys = []
        for key in mandatory_keys:
            if key not in self._dict:
                missing_mandatory_keys.append(key)
        if missing_keys:
            raise AssertionError('Config missing mandatory key(s): %s' %
                                 ', '.join(missing_mandatory_keys))


def new_config() -> Config:
    def _load_public_dict() -> _StrDict:
        with open(PUBLIC_CONFIG_FP) as public_file:
            return json.load(public_file)

    def _load_local_dict() -> Optional[_StrDict]:
        if not os.path.exists(LOCAL_CONFIG_FP):
            return None
        with open(LOCAL_CONFIG_FP) as local_file:
            return json.load(local_file)

    public_dict = _load_public_dict()
    local_dict = _load_local_dict()
    return Config(public_dict, local_dict)
